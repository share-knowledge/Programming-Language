#include "log.h"


util::src::severity_logger<util::trivial::severity_level> lg;

void log()
{
	LOG(lg, error) << "dsds 等等";

}

int main()
{
	util::init_log();

	log();

	return 0;
}

