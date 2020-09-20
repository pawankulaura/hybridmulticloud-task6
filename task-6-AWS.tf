provider "aws" {
    region = "ap-south-1"
    profile = "pawan"
}

resource "aws_db_subnet_group" "subnet" {
  name       = "main"
  subnet_ids = ["subnet-46157e0a", "subnet-d2fd40a9", "subnet-ccfdc7a4"]


  tags = {
    Name = "DB Subnet"
  }
}
resource "aws_db_instance" "MySQL" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "MySQLDB"
  username             = "pawan"
  password             = "thisismydb"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.subnet.name}"
  publicly_accessible = true
  iam_database_authentication_enabled = true


tags = {
    Name  = "SQL"
}
}
output "ip" {
  value = aws_db_instance.MySQL.address
  }
