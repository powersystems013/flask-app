pipeline {
	agent any

	stages {
		stage('Checkout') {
			steps {
				// Checkout the code from the repository
				checkout scm
			}
		}

		stage('Install Dependencies') {
			steps {
				script {
					// Install dependencies (adjust as needed)
					sh 'pip install -r requirements.txt'
				}
			}
		}

		stage('Run Unit Tests') {
			steps {
				script {
					// Run unit tests (adjust as needed)
					sh 'pytest'
				}
			}
		}

		stage('Build and Deploy') {
			steps {
				script {
					// Build the Docker image
					docker.build("my-docker-python-app")

					// Run unit tests inside the Docker container (optional)
					docker.image("my-docker-python-app").inside {
						sh 'pytest'
					}

					// Push the Docker image to Docker Hub (optional)
					// sh 'docker login -u<username> -p<password>'
					// docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
					//     docker.image("my-docker-python-app").push()
					// }

					// Run the Docker container
					docker.image("my-docker-python-app").withRun('-p 2000:2000 --name my-docker-container') {
						// Container is running
					}
				}
			}
		}
	}

	post {
		always {
			// Cleanup: Stop and remove the Docker container
			script {
				docker.image("my-docker-python-app").stop()
				docker.image("my-docker-python-app").remove()
			}
		}
	}
}
