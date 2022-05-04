using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace MovieWatcher.Models
{
    public class Movie
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int RatingId { get; set; }
        public int TrailerId { get; set; }

        public Rating Rating { get; set; }
        public Trailer Trailer { get; set; }

        public Movie()
        {
            Rating = new Rating();
            Trailer = new Trailer();
        }

        public override string ToString()
        {
            return $"{Title}:{Rating}:{Description}";
        }
    }
}
