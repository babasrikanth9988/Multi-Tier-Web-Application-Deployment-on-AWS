# Define EC2 instance for web server
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.web.id]

  // Define other instance settings...
}

# Define auto-scaling group for web servers
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 2
  min_size         = 2
  max_size         = 10

  // Define other auto-scaling settings...
}
