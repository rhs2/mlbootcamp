import logging
#configure logging levels
logging.basicConfig(
    filename='data/app.log',
    filemode='w',
    level = logging.DEBUG,
    format = " %(asctime)s-%(name)s-%(levelname)s-%(message)s",
    datefmt="%Y-%m-%d %H:%M:%S"
)
#log messages with different severity levels
logging.debug('This is a debug message')
logging.info('This is an info message')
logging.warning('this is a warning message')
logging.error('this is an error message')
logging.critical('this is a critical message')