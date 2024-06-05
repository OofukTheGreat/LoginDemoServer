using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace LoginDemoServer.Models;

public partial class LoginDemoDbContext : DbContext
{
    public Models.User GetUSerFromDB(string email)
    {
        return this.Users.Where(u => u.Email == email).FirstOrDefault();
    }
    public Models.User GetUserGrades(string email) 
    {
        return this.Users.Where(u => u.Email == email).Include(g => g.Grades).FirstOrDefault();
    }
}

