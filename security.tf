# Define security group for database
resource "aws_security_group" "db" {
  vpc_id = aws_vpc.main.id

  // Define ingress and egress rules...
}
