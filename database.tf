# Define RDS instance for database
resource "aws_db_instance" "db" {
  engine         = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 20
  storage_type      = "gp2"
  subnet_group_name = "default"
  vpc_security_group_ids = [aws_security_group.db.id]

  // Define other RDS settings...
}
