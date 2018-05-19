using System;

namespace test2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine("This is Test2 program");

            int num = GetNum();

            Console.WriteLine("Got NUM: " + num.ToString());
        }

        static int GetNum()
        {
          int i = 0;
          i+= 3;

          int j = 4;
          j = GetMoreNum();
          return i+j;
        }

        static int GetMoreNum()
        {
          int k = 4;
          return k+3;
        }
    }
}
