# Ansible on Azure Terraform 프로젝트

- Ansible 실습용 테라폼 코드입니다.
- 안되는 점이 있으면, nswlah@gmail.com 으로 메일 주시면 감사하겠습니다.

## 설정

1. Azure CLI 로그인
   ```
   az login
   ```

2. SSH 키 생성 (이미 있다면 생략)
   ```
   ssh-keygen -t rsa -b 4096
   ```

3. `variables.tf` 파일에서 필요한 변수들을 확인하고 수정

4. Terraform 초기화
   ```
   terraform init
   ```

5. Terraform 계획 확인
   ```
   terraform plan
   ```

6. Terraform 적용
   ```
   terraform apply --auto-approve
   ```

7. 리소스 생성이 완료되면 출력된 IP 주소를 사용하여 VM에 접속

8. 리소스 삭제 명령어(더 이상 사용안하면 지워주세요)

```
terraform destroy
```
