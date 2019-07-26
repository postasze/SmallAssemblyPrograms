#include <iostream>
using namespace std;

extern "C" char* dechex(char* destination, int source);

int main ()
{
  int value = 255;
	char *result = (char*) malloc(100);
	cout << "Test dechex: " << endl;
	result = dechex(result, value);
	cout << "primary decimal value: " << value << endl;
	cout << "result hexadecimal value: " << result << endl;
	return 0;
}
