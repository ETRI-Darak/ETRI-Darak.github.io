# ETRI-Darak.github.io

ETRI 기독신우회 "다락회" 소개용 GitHub Pages 저장소입니다.

현재 목표는 저장소 루트를 1페이지 소개 사이트로 단순화하는 것이며, 작업 참고용으로 `ETRI-XAINLP.github.io/` 디렉토리에 과거 커스터마이즈 버전을 함께 보관하고 있습니다.

배포 주소: `https://ETRI-Darak.github.io/`
원격 저장소: `https://github.com/ETRI-Darak/ETRI-Darak.github.io`

## 기술 스택

- Jekyll 3.8 계열
- Bundler 2.1 이상
- GitHub Pages
- Phantom 테마 기반 정적 사이트

## 주요 파일

- `_config.yml`: 사이트 기본 설정, 메뉴, 제목, 설명
- `index.html`: 홈 진입점
- `about.md`: 소개 페이지 콘텐츠
- `_layouts/`, `_includes/`: 공통 레이아웃과 섹션 템플릿
- `css/style.scss`: 스타일 커스터마이즈
- `img/`: 이미지 자산
- `ETRI-XAINLP.github.io/`: 과거 1페이지 프로젝트 사이트 참고본

## 개발 환경 설치

이 저장소는 Ruby `2.6.10` + Bundler `2.1.4` 조합에서 확인했습니다. macOS 기본 Ruby 환경에서는 Bundler 1.x가 잡혀 있을 수 있는데, 이 경우 `bundle install`이 실패합니다.

1. Ruby 버전을 확인합니다.

```bash
ruby -v
```

2. Bundler `2.1.4`를 설치합니다.

```bash
gem install bundler:2.1.4 --user-install
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
bundle -v
```

`--user-install` 방식이 번거롭거나 PATH 설정 없이 시스템 Ruby에 바로 설치하려면 아래 명령도 가능합니다.

```bash
sudo gem install bundler:2.1.4
bundle -v
```

3. 저장소 루트에서 의존성을 설치합니다.

```bash
bash setup.sh
```

주의:
- `setup.sh`는 `sudo`로 실행하지 않습니다.
- 한 번이라도 `sudo bash setup.sh`를 실행했다면 `vendor/` 권한이 꼬일 수 있습니다.
- 이 경우 아래처럼 소유권을 되돌린 뒤 다시 실행합니다.

```bash
sudo chown -R "$USER" ./vendor
bash setup.sh
```

## 로컬 실행

1. 개발 서버를 실행합니다.

```bash
bash serve.sh
```

2. 브라우저에서 아래 주소를 엽니다.

```text
http://127.0.0.1:2046
```

3. 빌드 산출물과 설정 상태를 점검하려면 아래 명령을 사용합니다.

```bash
bash clean.sh
```

## 배포 절차

현재 저장소에는 별도 GitHub Actions 배포 워크플로가 없고, 원격은 `master` 브랜치 하나만 사용하고 있습니다. 따라서 현재 기준 배포 절차는 아래와 같이 정리할 수 있습니다.

1. 로컬에서 수정 후 `bash serve.sh`로 화면을 확인합니다.
2. 필요하면 `bash clean.sh` 또는 `bundle exec jekyll build`로 빌드 상태를 점검합니다.
3. 변경 파일을 커밋합니다.

```bash
git status
git add .
git commit -m "Update Darak site"
```

4. 원격 `master` 브랜치로 푸시합니다.

```bash
git push origin master
```

5. GitHub Pages 반영 후 공개 사이트에서 결과를 확인합니다.

## 작업 메모

- 루트 저장소가 실제 배포 대상입니다.
- `ETRI-XAINLP.github.io/` 디렉토리는 참고용 사본이며 현재 Git 추적 대상이 아닙니다.
- 1페이지 다락회 소개 사이트로 정리할 때는 블로그형 포스트/페이지네이션 구조를 최대한 줄이는 방향으로 진행합니다.
- `setup.sh`는 gem을 `vendor/bundle`에 설치하고, 구형 Ruby 환경에서 플랫폼 gem 충돌을 줄이기 위해 source gem 우선 설정을 함께 적용합니다.

## 문제 해결

`This Gemfile requires a different version of Bundler` 오류가 나면 Bundler 2.x가 활성화되지 않은 상태입니다.

```bash
gem install bundler:2.1.4 --user-install
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
bundle -v
```

`vendor/bundle` 권한 문제로 `setup.sh`가 실패하면:

```bash
sudo chown -R "$USER" ./vendor
bash setup.sh
```
