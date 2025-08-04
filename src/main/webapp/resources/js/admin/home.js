document.addEventListener('DOMContentLoaded', () => {
  // === 상단 슬라이드 텍스트 데이터 ===
  const slides = [
    {
      emoji: '💻',
      line1: 'IT 교육, 이제는 검증된 곳에서.',
      line2: '5년간 10,000명 이상의 수강생이 선택한 LunaCode.',
      img: ''
    },
    {
      emoji: '🎯',
      line1: '수강생 10,000명 돌파 · 합격률 92%,실무 전환 성공률 80% ',
      line2: '',
      img: ''
    },
    {
      emoji: '🚀',
      line1: '“코딩? 나도 아무것도 몰랐어요.”',
      line2: '지금 당신의 시작도, 여기서부터입니다.',
      img: ''
    },
    {
      emoji: '🛠️',
      line1: '실무 중심 커리큘럼, 실전 프로젝트',
      line2: '지금 당신의 시작도, 여기서부터입니다.',
      img: ''
    },
    {
      emoji: '🌟',
      line1: '불안한 시작이지만, 끝은 달랐어요.',
      line2: '당신도 할 수 있어요. LunaCode가 함께합니다.',
      img: ''
    },
  ];

  let currentSlide = 0;
  const slideEl = document.getElementById('slide-text');

  // 타이핑 함수
  function typeText(target, text, cb) {
    target.textContent = '';
    let i = 0;
    function typing() {
      if (i < text.length) {
        target.textContent += text[i++];
        setTimeout(typing, 50); // 타이핑 속도
      } else if (cb) {
        cb();
      }
    }
    typing();
  }

  // 상단 텍스트 표시
  function showSlide() {
    if (!slideEl) return;

    slideEl.classList.add('slide-enter');
    setTimeout(() => {
      const slide = slides[currentSlide];

      slideEl.innerHTML = `
        <div style="margin-bottom:10px; line-height:1.3; display:flex; justify-content:center; align-items:center; flex-direction: column;">
          <div style="display:flex; justify-content:center; align-items:center;">
            <span style="font-size:2.3rem; margin-right:6px;">${slide.emoji}</span>
            <span id="typer-line1"></span>
          </div>
          ${slide.line2 ? `<div id="typer-line2"></div>` : ''}
        </div>
        <div>${slide.img}</div>
      `;

      slideEl.classList.remove('slide-enter');

      const line1Target = document.getElementById('typer-line1');
      if (!line1Target) return;

      typeText(line1Target, slide.line1, () => {
        if (slide.line2) {
          const line2Target = document.getElementById('typer-line2');
          if (line2Target) {
            typeText(line2Target, slide.line2);
          }
        }
      });

      currentSlide = (currentSlide + 1) % slides.length;
    }, 400);
  }

  // 최초 슬라이드
  if (slideEl) {
    const firstSlide = slides[0];
    slideEl.innerHTML = `
      <div style="margin-bottom:10px; line-height:1.3; display:flex; justify-content:center; align-items:center; flex-direction: column;">
        <div style="display:flex; justify-content:center; align-items:center;">
          <span style="font-size:2.3rem; margin-right:6px;">${firstSlide.emoji}</span>
          <span id="typer-line1"></span>
        </div>
        ${firstSlide.line2 ? `<div id="typer-line2"></div>` : ''}
      </div>
      <div>${firstSlide.img}</div>
    `;
    const firstLine1Target = document.getElementById('typer-line1');
    if (firstLine1Target) {
      typeText(firstLine1Target, firstSlide.line1, () => {
        if (firstSlide.line2) {
          const firstLine2Target = document.getElementById('typer-line2');
          if (firstLine2Target) {
            typeText(firstLine2Target, firstSlide.line2);
          }
        }
      });
    }
    currentSlide = 1;
  }

  setInterval(showSlide, 3500);

  // === 하단 텍스트 타이핑 (스크롤 연동) ===
  const bottomTextEl = document.getElementById('bottom-typer'); 
  if (bottomTextEl) {
    const originalText = bottomTextEl.textContent.trim();
    bottomTextEl.textContent = '';

    let typed = false;

    const observer = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting && !typed) {
          typeText(bottomTextEl, originalText);
          typed = true;
          observer.unobserve(bottomTextEl);
        }
      });
    }, {
      threshold: 0.5
    });

    observer.observe(bottomTextEl);
  }
});

document.addEventListener('DOMContentLoaded', function () {
  const sugDiv = document.getElementById('suggestions');
  const target = document.getElementById('observeTarget'); // 관찰 대상
  let hasShown = false;

  // 초기 숨김 상태 설정
  sugDiv.style.opacity = 0;
  sugDiv.style.maxHeight = '0px';
  sugDiv.style.transition = 'opacity 0.5s ease, max-height 0.5s ease';

  // IntersectionObserver 설정
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting && !hasShown) {
        hasShown = true;

        // 700ms 뒤에 자연스럽게 나타나게
        setTimeout(() => {
          sugDiv.style.opacity = 1;
          sugDiv.style.maxHeight = '500px';
        }, 300);
      }
    });
  }, {
    threshold: 0.3 // 요소가 30% 보이면 작동
  });

  if (target) {
    observer.observe(target);
  }
});
