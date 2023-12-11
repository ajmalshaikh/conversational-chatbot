pipeline {
  agent any

  environment {
    TF_CLI_ARGS = "-input=false"
    // Add other environment variables as needed
  }

  stages {
    stage('Checkout') {
      steps {
        script {
          git branch: 'main', url: 'https://github.com/ajmalshaikh/conversational-chatbot.git'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        script {
          sh 'terraform init'
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Build and Push Docker Image') {
      steps {
        script {
          // Build and push Docker image
          sh 'docker build -t your-docker-image .'
          sh 'docker push your-docker-image'
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        script {
          // Deploy using Helm
          sh 'helm upgrade --install your-release-name ./helm/chart'
        }
      }
    }
  }

  post {
    success {
      echo 'Pipeline succeeded! You can add more post-success actions here.'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}
