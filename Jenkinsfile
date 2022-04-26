pipeline {
    agent any
    tools {
        jdk 'jdk-17' 
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
	}

    stages {
        stage("build project") {
            steps {
                echo 'building project...'
                sh "mvn clean package"
            }
        }
        stage("Test project") {
            steps {
                echo 'testing project...'
                sh "mvn test"
            }
        }
        stage("build/push image") {
            when {
                branch 'main' 
            }
        	steps {
				sh 'docker build -t therealayukjunior/jenkins-demo:latest .'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push therealayukjunior/jenkins-demo:latest'
			}}
        stage("Pull image") {
            when {
                branch 'main' 
            }
            steps {
                echo 'pulling docker project...'
                sh "docker pull therealayukjunior/jenkins-demo:latest "
            }
        }
        stage("Run image") {
            when {
                branch 'main' 
            }
            steps {
                echo 'running docker project...'
                sh "docker run --name my-app therealayukjunior/jenkins-demo:latest -d "
                sh "docker ps"
                sh "docker stop my-app"
            }
        }
    }
}