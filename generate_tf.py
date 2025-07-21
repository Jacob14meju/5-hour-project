from jinja2 import Environment, FileSystemLoader
env = Environment(loader=FileSystemLoader('.'))
template = env.get_template('main.tf.j2')
import subprocess

aws_region = str(input("enter your AWS region: "))
ami_id = str(input("enter your AMI ID: "))
instance_type = str(input("enter your instance type: "))
#availability_zone = str(input("enter your availability zone: "))
lb_name = str(input("enter your load balancer name: "))
tg_name = str(input("enter your target group name: "))

# importing the template and rendering it with the provided variables
# Note: Ensure that the variables in the template match those provided here

data = {'aws_region': aws_region,
        'ami_id': ami_id,
        'instance_type': instance_type,
        'lb_name': lb_name,
        'tg_name': tg_name}


output = template.render(data)
try:
    with open('main.tf', 'w') as f:
        f.write(output)
except Exception as e:
    print(f"Error writing to file: {e}")

print("Terraform configuration file 'main.tf' has been generated successfully.")

# Running the terra-run.sh script to apply the Terraform configuration
try:
    co = subprocess.Popen(['bash', 'terra-run.sh'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    for line in co.stdout:
        print(line.decode(), end='')

    if co.returncode != 0:
        print(f'ERROR: {co.stderr}')


    val = subprocess.run(['python3', 'validation_boto3.py']], capture_output=True, text=True)
    if val.returncode != 0:
        print(f'Validation Error: {val.stderr}')
    else:
        print('Validation completed successfully.')
except Exception as e:
    print(f"Error running script automation: {e}")
print("Terraform configuration applied and validation completed.")