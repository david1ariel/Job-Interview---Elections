using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace David
{
    public partial class Elections2Context : DbContext
    {
        public Elections2Context()
        {
        }

        public Elections2Context(DbContextOptions<Elections2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Party> Parties { get; set; }
        public virtual DbSet<Voter> Voters { get; set; }
        public virtual DbSet<VotersParty> VotersParties { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-C2FEDD5\\SQLEXPRESS;Database=Elections2;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Hebrew_CI_AS");

            modelBuilder.Entity<Party>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(1000);

                entity.Property(e => e.ImageFileName).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Voter>(entity =>
            {
                entity.Property(e => e.VoterId).HasMaxLength(50);

                entity.Property(e => e.CellPhone).HasMaxLength(50);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Gender).HasMaxLength(50);

                entity.Property(e => e.IdProdDate).HasColumnType("date");
            });

            modelBuilder.Entity<VotersParty>(entity =>
            {
                entity.Property(e => e.VoterId)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Party)
                    .WithMany(p => p.VotersParties)
                    .HasForeignKey(d => d.PartyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VotersParties_Parties");

                entity.HasOne(d => d.Voter)
                    .WithMany(p => p.VotersParties)
                    .HasForeignKey(d => d.VoterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VotersParties_Voters");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
