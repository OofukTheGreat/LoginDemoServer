using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LoginDemoServer.Models;

public partial class Grade
{
    [Key]
    public int TestId { get; set; }

    [Column("Grade")]
    public int Grade1 { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? TestDate { get; set; }

    [StringLength(50)]
    public string SubjectName { get; set; } = null!;

    [StringLength(100)]
    public string? StudentEmail { get; set; }

    [ForeignKey("StudentEmail")]
    [InverseProperty("Grades")]
    public virtual User? StudentEmailNavigation { get; set; }
}
