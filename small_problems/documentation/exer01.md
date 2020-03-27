Locate the ruby documentation for methods File::path and File#path. How are they different?

File::path is a class method, while File#path is an instance method.

File::path returns the string representation of the path.
Syntax for File::path looks like File.path("/dev/null"), which would return "/dev/null".

File#path returns the pathname used to create file as a string. The pathname may have become void
if the file has been moved or deleted. 