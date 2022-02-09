using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Forum.Domain
{
    public class Answer
    {
        public virtual int Id { get; set; }
        public virtual User AuthorId { get; set; }
        public virtual Post PostId { get; set; }
        public virtual DateTime Date { get; set; }
        public virtual string Contents { get; set; }
    }
}
