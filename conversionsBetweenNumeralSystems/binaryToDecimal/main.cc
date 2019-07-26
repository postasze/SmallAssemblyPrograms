#include <iostream>
using namespace std;

extern "C" int bindec(const char *source);

int main ()
{
  char value[] = "1101010"; // uwaga najmlodszy bit jest najbardziej z prawej
	int result = 0;
	cout << "Test bindec: " << endl;
	result = bindec(value);
	cout << "primary binary value: " << value << endl;
	cout << "result decimal value: " << result << endl;
	return 0;
}
