pipeline {
    agent any
    
    environment {
        ROBOT_OPTIONS = "--outputdir results"  // Diretório onde os resultados dos testes serão salvos
    }

    stages {
        stage('Preparar Ambiente') {
            steps {
                echo "Instalando dependências..."
                script {
                    try {
                        sh 'pip install robotframework==6.0.2'
                        sh 'pip install selenium==4.10.0'
                        sh 'pip install robotframework-seleniumlibrary==6.0.0'
                        sh 'pip install webdriver-manager'  // Para gerenciar os drivers do navegador
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Falha na instalação das dependências: ${e}"
                    }
                }
            }
        }
        
        stage('Executar Testes') {
            steps {
                echo "Executando teste com relatório HTML..."
                script {
                    try {
                        sh "robot ${ROBOT_OPTIONS} -d results inspira_smoke.robot"  // Substitua "inspira_smoke.robot" pelo nome do seu arquivo de testes
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        error "Falha na execução dos testes: ${e}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Arquivando resultados dos testes..."
            archiveArtifacts artifacts: 'results/*.xml'
            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'results',
                reportFiles: 'report.html',
                reportName: 'Relatório do Robot Framework'
            ])
        }
        
        failure {
            echo "Alguns testes falharam."
        }
    }
}
