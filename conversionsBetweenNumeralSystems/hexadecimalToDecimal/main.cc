#include <iostream>
using namespace std;

extern "C" int hexdec(const char *source);

int main ()
{
  char value[] = "af72"; // uwaga najmlodszy bit jest najbardziej z prawej
	int result = 0;
	cout << "Test hexdec: " << endl;
	result = hexdec(value);
	cout << "primary heaxadecimal value: " << value << endl;
	cout << "result decimal value: " << result << endl;
	return 0;
}
