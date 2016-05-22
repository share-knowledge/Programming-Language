#ifndef _UTIL_LOG_H__
#define _UTIL_LOG_H__


#include <boost/log/trivial.hpp>
#include <boost/log/utility/setup.hpp>
#include <boost/log/attributes/current_process_name.hpp>
#include <boost/log/attributes/current_process_id.hpp>
#include <boost/log/attributes/current_thread_id.hpp>
#include <boost/log/sources/severity_feature.hpp>
#include <boost/log/sources/global_logger_storage.hpp>
#include <boost/log/attributes/mutable_constant.hpp>

namespace util
{
namespace logging = boost::log;
namespace attr = boost::log::attributes;
namespace trivial = boost::log::trivial;
namespace src = boost::log::sources;

#define LOGGER(logger, sev) \
util::logging::attribute_cast<util::attr::mutable_constant<int> \
	>(util::logging::core::get()->get_global_attributes()["Line"]).set(__LINE__); \
	util::logging::attribute_cast<util::attr::mutable_constant<std::string> \
	>(util::logging::core::get()->get_global_attributes()["File"]).set(__FILE__); \
	util::logging::attribute_cast<util::attr::mutable_constant<std::string> \
	>(util::logging::core::get()->get_global_attributes()["Function"]).set(__func__); \
BOOST_LOG_SEV(logger, util::trivial::sev)

static void init_log()
{
	static const std::string COMMON_FMT("%TimeStamp% %LineID% [%Line%:%Function%:%File%]"
			" [%Process%:%ProcessID%:%ThreadID%] [%Severity%] %Message%");

	logging::register_simple_formatter_factory<logging::trivial::severity_level, char>("Severity");

	logging::add_console_log(std::cout,
			logging::keywords::format=COMMON_FMT,
			logging::keywords::auto_flush=true);

	logging::add_file_log(logging::keywords::file_name="app.%Y-%m-%d_%H_%N.log",
			logging::keywords::target="./logs",
			logging::keywords::open_mode=std::ios::app,
			logging::keywords::rotation_size=20 * 1024 *1024, // 单文件大小限制
			logging::keywords::max_size=1 * 1024 * 1024 *1024, // 所有日志大小限制
			logging::keywords::min_free_space = 500 * 1024 * 1024 * 1024, // 磁盘限制
			logging::keywords::time_based_rotation=logging::sinks::file::rotation_at_time_interval(boost::posix_time::hours(1)),
			logging::keywords::format=COMMON_FMT,
			logging::keywords::auto_flush=true);

	logging::core::get()->add_global_attribute("Process", attr::current_process_name());
	logging::core::get()->add_global_attribute("ProcessId", attr::current_process_id());
	logging::core::get()->add_global_attribute("ThreadID", attr::current_thread_id());

	logging::core::get()->add_global_attribute("Line", attr::mutable_constant<int>(0));
	logging::core::get()->add_global_attribute("File", attr::mutable_constant<std::string>(""));
	logging::core::get()->add_global_attribute("Function", attr::mutable_constant<std::string>(""));

#ifndef _DEBUG
	logging::core::get()->set_filter(logging::trivial::severity >= logging::trivial::info);
#endif

	logging::add_common_attributes();
	return;
}

} // namespae

#endif //

