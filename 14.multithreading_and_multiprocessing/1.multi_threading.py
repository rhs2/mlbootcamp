### Multithreading
## When to use Multi Threading
###I/O-bound tasks: Tasks that spend more time waiting for I/O operations (e.g., file operations, network requests).
###  Concurrent execution: When you want to improve the throughput of your application by performing multiple operations concurrently.
import threading
import time

def print_number():
    for i in range(5):
        time.sleep(2)
        print(f'Number: {i}')
def print_letter():
    for letter in "abced":
        time.sleep(2)
        print(f'Letter: {letter}')

#create 2 thread
t1 = threading.Thread(target= print_number)
t2 = threading.Thread(target= print_letter)

#starting time
start_time = time.time()

#staring the thread
t1.start()
t2.start()

#wait for the thread to complete
t1.join()
t2.join()

end_time = time.time()- start_time
print(end_time)
