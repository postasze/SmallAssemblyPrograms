#include <iostream>
#include <string.h>
using namespace std;

extern "C" char* decbin(char* destination, int source);

int main ()
{
  int value = 134;
	char *result = (char*) malloc(100);
	cout << "Test decbin: " << endl;
	result = decbin(result, value);
	cout << "primary decimal value: " << value << endl;
	cout << "result binary value: " << result << endl;
	return 0;
}
