pipeline {
    agent any
    tools {
        jdk 'jdk-17' 
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred')
     //   REMOTE_KEY= credentials('remote_key')
        REMOTE_USER='user'
        REMOTE_HOST='10.0.0.1'
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
                sh 'docker rmi therealayukjunior/jenkins-demo:latest'
                sh "docker run --name my-app -d therealayukjunior/jenkins-demo:latest"
                sh "docker ps"
                sh "docker stop my-app"
                sh 'docker rm my-app'
            }
        }

        stage ('Deploy') {
         when {
            branch 'main' 
         }
        steps {
             sh 'echo "hello"'
        /*    sh 'mkdir ~/.ssh'
            sh 'echo "$REMOTE_KEY" > ~/.ssh/my_server_key'
            sh 'chmod 600 ~/.ssh/my_server_key'
            sh 'scp -e "ssh -i ~/.ssh/my_server_key -o StrictHostKeyChecking=no" deploy.sh ${REMOTE_USER}@${REMOTE_HOST}:~/'
            sh 'ssh -i ~/.ssh/my_server_key -o StrictHostKeyChecking=n ${REMOTE_USER}@${REMOTE_HOST} "chmod +x deploy.sh"'
            sh 'ssh -i ~/.ssh/my_server_key -o StrictHostKeyChecking=n ${REMOTE_USER}@${REMOTE_HOST} ./deploy.ssh' */
        }
        }
    }
}


