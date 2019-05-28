#include <algorithm>
#include <future>
#include <iostream>
#include <map>
#include <memory>
#include <mutex>
#include <queue>
#include <set>
#include <vector>

using namespace std;

template <typename Stream>
class SyncStream {
 public:
  SyncStream(Stream &stream) : stream_(&stream) { mutex_.lock(); }

  ~SyncStream() { mutex_.unlock(); }

  template <typename T>
  SyncStream &operator<<(const T &rhs) {
    (*stream_) << rhs;
    return *this;
  }

  SyncStream &operator<<(std::ostream &(*manip)(std::ostream &)) {
    (*stream_) << manip;
    return *this;
  }

 private:
  static std::mutex mutex_;
  Stream *stream_;
};

template <typename Stream>
std::mutex SyncStream<Stream>::mutex_;

template <typename Stream>
SyncStream<Stream> synchronized(Stream &stream) {
  return SyncStream<Stream>(stream);
}

int main() {
  const int n = 10;
  std::vector<std::future<void>> futures(n);
  for (int i = 0; i < n; ++i) {
    futures[i] = std::async(std::launch::async, [i]() {
      std::this_thread::sleep_for(std::chrono::milliseconds(1));
      synchronized(std::cout) << "thread id " << i << std::endl;
    });
  }
  for (const auto &future : futures) {
    future.wait();
  }
  return 0;
}
