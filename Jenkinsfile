pipeline {
agent any

stages {
    stage('Checkout') {
        steps {
            echo 'Source code checkout from GitHub'
            checkout scm
        }
    }

    stage('Build') {
        steps {
            bat 'javac App.java'
        }
    }

    stage('Test') {
        steps {
            bat 'java App'
        }
    }

    stage('Docker Build') {
        steps {
            bat 'docker build -t set15-app:latest .'
        }
    }

    stage('Deploy to Kubernetes') {
        steps {
            bat 'kubectl apply -f deployment.yaml'
        }
    }

    stage('Verify Deployment') {
        steps {
            bat 'kubectl rollout status deployment/set15-app --timeout=120s'
            bat 'kubectl get deployments'
            bat 'kubectl get pods'
            bat 'kubectl get services'
        }
    }
}

post {
    success {
        echo 'CI/CD Pipeline completed successfully!'
    }

    failure {
        echo 'Pipeline failed. Check Console Output for errors.'
    }
}

}