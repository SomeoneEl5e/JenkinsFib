pipeline {
    agent any

    parameters {
        string(name: 'userInput', defaultValue: '0', description: 'A numeric parameter')
    }

    environment {
        OUTPUT_FILE = 'output.html'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/SomeoneEl5e/JenkinsFib.git'  // Replace with your repository URL
            }
        }

        stage('Run Shell Script') {
            steps {
                script {
                    def output = sh(script: "bash Fibonacci.sh ${params.userInput}", returnStdout: true).trim()
                    writeFile file: OUTPUT_FILE, text: "<html><body><h1>Output</h1><p>${output}</p></body></html>"
                }
            }
        }

        stage('Display Parameter') {
            steps {
                script {
                    currentBuild.description = "Numeric parameter is ${params.userInput}"
                }
            }
        }

        stage('Verify Parameter on Web Page') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.userInput}")) {
                        echo "Parameter ${params.userInput} exists on the web page."
                    } else {
                        error "Parameter ${params.userInput} does not exist on the web page."
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: OUTPUT_FILE, fingerprint: true
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: OUTPUT_FILE,
                reportName: 'Shell Script Output'
            ])
        }
    }
}
