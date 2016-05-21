#include <stdio.h>
#include <signal.h>
#include <event2/event.h>
#include <event2/http.h>
#include <event2/keyvalq_struct.h>
#include <event2/buffer.h>



static void dump_request_cb(struct evhttp_request *req, void *arg)
{
	const char *cmdtype;
	struct evkeyvalq *headers;
	struct evkeyval *header;
	struct evbuffer *buf;

	switch(evhttp_request_get_command(req))
	{
		case EVHTTP_REQ_GET:
			cmdtype = "GET";
			break;
		case EVHTTP_REQ_POST:
			cmdtype = "POST";
			break;
		case EVHTTP_REQ_HEAD:
			cmdtype = "HEAD";
			break;
		case EVHTTP_REQ_DELETE:
			cmdtype = "delete";
			break;
		case EVHTTP_REQ_OPTIONS:
			cmdtype = "OPTIONS";
			break;
		case EVHTTP_REQ_TRACE:
			cmdtype = "TRACE";
			break;
		case EVHTTP_REQ_CONNECT:
			cmdtype = "CONNECT";
			break;
		case EVHTTP_REQ_PATCH:
			cmdtype = "PATCH";
			break;
		default:
			cmdtype = "unknow";
			break;
	}

	printf("Received a %s request for %s\nHeaders:\n", cmdtype
			, evhttp_request_get_uri(req));

	headers = evhttp_request_get_input_headers(req);

	for(header = headers->tqh_first; header; header = header->next.tqe_next)
	{
		printf("	%s: %s\n", header->key, header->value);
	}


	buf = evhttp_request_get_input_buffer(req);

	puts("Input data: <<<");
	while(evbuffer_get_length(buf))
	{
		int n;
		char cbuf[128];
		n = evbuffer_remove(buf, cbuf, sizeof(cbuf));
		if(n > 0)
		{
			fwrite(cbuf, 1, n, stdout);
		}
	}

	puts(">>>");


	struct evbuffer *response;
	response = evbuffer_new();

	evbuffer_add_printf(response, "you are request succ!\n");

	evhttp_send_reply(req, 200, "ok dump", response);

	evbuffer_free(response);

	printf("send success!\n");
}

static void send_document_cb(struct evhttp_request *req, void *arg)
{

	evhttp_send_reply(req, 200, "ok send", NULL);
}

static void syntax(void)
{
	fprintf(stdout, "Syntax: http-server <docroot>\n");
}

int main(int argc, char *argv[])
{
	struct event_base *base;
	struct evhttp *http;
	struct evhttp_bound_socket *handle;

	unsigned short port = 9000;

	if(signal(SIGPIPE, SIG_IGN) == SIG_ERR)
	{
		return 1;
	}

	if(argc < 2)
	{
		syntax();
		return 1;
	}

	base = event_base_new();
	
	if(!base)
	{
		fprintf(stderr, "Couldn't create an event_base: exiting\n");
		return 1;
	}

	http = evhttp_new(base);

	if(!http)
	{
		fprintf(stderr, "Couldn't create evtttp, exiting.\n");
		return 1;
	}

	// 特定uri
	evhttp_set_cb(http, "/dump", dump_request_cb, NULL);
	// 所有请求
	evhttp_set_gencb(http, send_document_cb, argv[1]);

	handle = evhttp_bind_socket_with_handle(http, "0.0.0.0", port);

	if(!handle)
	{
		fprintf(stderr, "couldn't bind to port %d, exiting.\n", port);

		return 1;
	}


	event_base_dispatch(base);

	fprintf(stdout, "exit.\n");

	return 0;
}


