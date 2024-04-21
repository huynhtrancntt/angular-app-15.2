// pipeline {

//   agent none

//   environment {
//     DOCKER_IMAGE = "huynhtrancntt/angular15.2"
//   }

//   stages {

//     stage("Test") {
//       agent {
//           docker {
//             image 'python:3.8-slim-buster'
//             args '-u 0:0 -v /tmp:/root/.cache'
//           }
//       }
//       steps {
//         sh "pip install poetry"
//         sh "poetry install"
//         sh "poetry run pytest"
//       }
//     }

//     stage("build") {
//       agent { node {label 'master'}}
//       environment {
//         DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
//       }
//       steps {
//         sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} . "
//         sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
//         sh "docker image ls | grep ${DOCKER_IMAGE}"
//         withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
//             sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
//             sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
//             // sh "docker push ${DOCKER_IMAGE}:latest"
//         }

//         //clean to save disk
//         sh "docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}"
//         // sh "docker image rm ${DOCKER_IMAGE}:latest"
//       }
//     }
//   }

//   post {
//     success {
//       echo "SUCCESSFUL"
//     }
//     failure {
//       echo "FAILED"
//     }
//   }
// }
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "huynhtrancntt/angular15.2"
    }

    stages {
        stage('Clone')
        {
            steps {
                    git 'https://github.com/huynhtrancntt/angular-app-15.2.git'
            }
        }
        stage('docker-build')
        {
            environment {
                DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
              }
            steps {

                echo "${DOCKER_IMAGE}:${DOCKER_TAG}";
                sh 'docker --version'
                // This step should not normally be used in your script. Consult the inline help for details.
            // // This step should not normally be used in your script. Consult the inline help for details.
            //     withDockerRegistry(credentialsId: 'docker-hub', url: 'https://index.docker.io/v1/') {
            //         // some block
            //     }
                // This step should not normally be used in your script. Consult the inline help for details.
                // This step should not normally be used in your script. Consult the inline help for details.
                // withDockerRegistry(credentialsId: 'docker-hub', url: ' https://index.docker.io/v1/') {
                //     // some block

                //     sh 'echo $DOCKER_PASSWORD | docker login --username huynhtrancntt --password-stdin'
                //     sh 'docker --version'
                //     sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                //         sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
                //         sh 'docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}'
                // }
            }
        }
    }
}