using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TestCSharpProject
{
    public class ClassA
    {
		public ClassB clsB; 
		public int count = 0;
    Task t;

		public ClassA()
        {
			clsB = new ClassB("teststr");
        t = Task.Run(new Action(TaskOnDiffThread));
        }


		public void MethodA_1()
        {
			clsB.MethodB_1();
			count = 22;
        }

        public int GetCount()
		{
			return count;

		}

        public void TaskOnDiffThread()
        {
            int cnt = GetCount();
            clsB.MethodB_1();
            if(count == 0)
            {
              count = 15;
              if(clsB != null)
              {
                clsB.MethodB_1();
              }
            }
            else
            {
              count = 34;
              if(clsB != null)
              {
                clsB.MethodB_1();
              }
            }
        }

        public void WaitForTask()
        {
            t.Wait();
        }
    }
}

