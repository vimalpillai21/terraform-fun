resource "aws_iam_user" "s3user1" {
    name = "s3user1"
}

resource "aws_iam_user" "s3user2" {
    name = "s3user2"
}

resource "aws_iam_user" "s3user3" {
    name = "s3user3"
}

resource "aws_iam_group" "s3group" {
    name = "s3group"
}

resource "aws_iam_group_membership" "s3-users" {
    name = "s3-users"
    users = [
        aws_iam_user.s3user1.name,
        aws_iam_user.s3user2.name,
        aws_iam_user.s3user3.name
    ]
    group = aws_iam_group.s3group.name
}

resource "aws_iam_policy_attachment" "s3-users-attach" {
    name = "s3-users-attach"
    groups = [aws_iam_group.s3group.name]
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}



