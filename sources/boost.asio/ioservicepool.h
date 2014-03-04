/*
 * ioservicepool.h
 *
 *  Created on: 2014-3-4
 *      Author: xiaobin
 */

#ifndef IOSERVICEPOOL_H_
#define IOSERVICEPOOL_H_

#include <vector>
#include <boost/asio.hpp>
#include <boost/noncopyable.hpp>
#include <boost/shared_ptr.hpp>

/*!
 * @class io_service_pool
 * @brief A pool of io_service objects.
 */
class io_service_pool: private boost::noncopyable {
public:
public:
  /// Construct the io_service pool.
  explicit io_service_pool(std::size_t pool_size);

  /// Run all io_service objects in the pool.
  void run();

  /// Stop all io_service objects in the pool.
  void stop();

  /// Get an io_service to use.
  boost::asio::io_service& get_io_service();

private:
  typedef boost::shared_ptr<boost::asio::io_service> io_service_ptr;
  typedef boost::shared_ptr<boost::asio::io_service::work> work_ptr;

  /// The pool of io_services.
  std::vector<io_service_ptr> io_services_;

  /// The work that keeps the io_services running.
  std::vector<work_ptr> work_;

  /// The next io_service to use for a connection.
  std::size_t next_io_service_;
};

#endif /* IOSERVICEPOOL_H_ */
