pipeline {
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any

    tools{
            terraform 'terraform15'
    }

    stages {
        stage('Git Fetch') {
            steps {
                git branch: 'terraform', url: 'https://gitlab.com/hexaview/oms_poc/-/tree/terraform/TerraformProject/Nodes'
            }
        }
         stage('Initialize Infrastructure') {
            steps {
                sh 'terraform init -force-copy'
            }
        }
         stage('View Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Approve Build & Start') {
               input{
                message "Start Building as per Plan??"
            }
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        stage('Destroy'){
             input{
                message "Do You Wanted To Destroy??"
            }
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}