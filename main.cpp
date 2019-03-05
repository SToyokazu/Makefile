extern "C"{
#include "test_c.h"
}
#include "test_cpp.h"

int main(void)
{
	Test *test = new Test;
	test->show();
	show();
	return 0;
}
