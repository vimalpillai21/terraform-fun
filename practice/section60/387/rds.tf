resource "aws_db_subnet_group" "mariadb-subnets" {
    name = "mariadb-subnets"
    description = "Amazon RDS subnet group"
    subnet_ids = [aws_subnet.levelup-private-1.id, aws_subnet.levelup-private-2.id]
}

resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
    name = "levelup-mariadb-parameters"
    family = "mariadb11.8"
    description = "MariaDB parameter group"
    parameter {
        name = "max_allowed_packet"
        value = "33434223"
    }
}

/* this instance will not be able to access internet. define
NAT gateway and private route table and association */

resource "aws_db_instance" "levelup-mariadb" {
    allocated_storage = 20
    engine = "mariadb"
    engine_version = "11.8.8"
    identifier = "mariadb"
    instance_class = "db.t3.micro"
    username = "root"
    password = "adminPass123"
    db_subnet_group_name = aws_db_subnet_group.mariadb-subnets.name
    parameter_group_name = aws_db_parameter_group.levelup-mariadb-parameters.name
    multi_az = "false"
    backup_retention_period = 0
    storage_type = "gp2"
    skip_final_snapshot = "true"
    availability_zone = aws_subnet.levelup-private-1.availability_zone
    vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
    tags = {
        Name = "levelup-mariadb"
    }
}

output "rds" {
    value = aws_db_instance.levelup-mariadb.endpoint
}

