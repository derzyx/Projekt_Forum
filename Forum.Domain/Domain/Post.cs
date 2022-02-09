using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Forum.Domain
{
    public class Post
    {
        public virtual int Id { get; set; }
        public virtual string Title { get; set; }
        public virtual string Contents { get; set; }
        public virtual User AuthorId { get; set; }
        public virtual DateTime Date { get; set; }
    }
}
