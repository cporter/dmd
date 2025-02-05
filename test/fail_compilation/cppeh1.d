// DISABLED: win32 win64
/*
TEST_OUTPUT:
---
fail_compilation/cppeh1.d(16): Error: cannot catch C++ class objects in @safe code
---
*/

version (Windows) static assert(0, "This test should not run on this platform");

#line 1
extern (C++, std)
{
    class exception { }
}

@safe:
void bar();
void abc();

void foo()
{
    try
    {
        bar();
    }
    catch (std.exception e)
    {
        abc();
    }
}
