pipeline{
  agent any
  //定义仓库地址
  environment {
      REPOSITORY="https://github.com/YuGanRepo/jenkins-test.git"
  }

  stages {

     /* stage('Fetch Code'){
          steps {
              echo "start fetch code from git:${REPOSITORY}"
              // 清空当前目录
              deleteDir()
              // 拉取代码
              git "${REPOSITORY}"
              // 清空之前的容器
              // sh 'docker stop $(docker ps -a -q)'
              // sh 'docker rm $(docker ps -a -q)'
          }
      } */

      stage('Maven 构建'){
          steps {
              echo "start maven compile"
              // 切换目录
              dir('demo') {
                  // 重新打包
                  sh 'mvn -Dmaven.test.skip=true -U clean install'
              }
          }
      }

      stage('构建镜像'){
          steps {
              echo "start build image"
              dir('demo') {
                  // build镜像
                  sh 'docker build -t 192.168.6.128:5000/jenkins-test:1.0 .'
                  // 登录镜像仓库
                  // sh 'docker login -u your_username -p your_password'
                  // 推送镜像到镜像仓库
                  sh 'docker push 192.168.6.128:5000/jenkins-test:1.0'
              }
          }
      }

      stage('启动服务'){
          steps {
              echo "start demo"
              // 部署服务
              sh 'docker run -d -p 8888:8888 --name=demo 192.168.6.128:5000/jenkins-test:1.0'
          }
      }

  }
}