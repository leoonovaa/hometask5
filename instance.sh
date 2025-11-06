aws ec2 run-instances \
    --image-id ami-0c398cb65a93047f2 \
    --count 1 \
    --instance-type t3.micro \
    --key-name "Anna dev" \
    --security-group-ids sg-0b860af46c50a3e51 \
    --subnet-id subnet-069edd1ee0ce5598a \
    --user-data file://daemon.sh \
    --output text