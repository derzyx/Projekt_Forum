using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Forum.BusinesLogic.Communication
{
    public class ServiceResponse
    {
        public bool Succes { get; set; }
        public string Message { get; set; }

        public ServiceResponse()
        {
            Succes = true;
        }
    }
}
