using Forum.BusinessLogic.NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Forum.BusinesLogic.Api
{
    public class BaseApi
    {
        public BaseApi()
        {
            NHibernateBase nHibernate = new NHibernateBase();
            nHibernate.Initialize();
        }
    }
}
