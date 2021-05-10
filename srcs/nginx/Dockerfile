# apline:3.12.0 버전 이미지 사용
FROM alpine:3.12.0

# 알파인 최신버전 업데이트 && 컨테이너에 캐시 저장 X
RUN apk update \
	&& apk --update --no-cache add \
# nginx, openssl(https사용 위한 인증서) 설치
	nginx \
	openssl

# 인증서 생성하는 파일을 저장
COPY ./nginx_setup.sh /usr/sbin/nginx_setup.sh
# 실행권한 추가
RUN chmod +x /usr/sbin/nginx_setup.sh
# nginx 설정파일 저장
COPY ./default.conf /etc/nginx/conf.d/

# 사용할 포트
EXPOSE 80 443

# docker run 시 실행할 명령
ENTRYPOINT ["/usr/sbin/nginx_setup.sh"]