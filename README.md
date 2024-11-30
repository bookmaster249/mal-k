<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hepsi Bir Arada - Güncellenmiş</title>
  <style>
    :root {
      --primary-color: #00796b;
      --secondary-color: #004d40;
      --background-light: #e0f7fa;
      --background-dark: #212121;
      --text-light: #ffffff;
      --text-dark: #333333;
    }

    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: var(--background-light);
      color: var(--text-dark);
      transition: background-color 0.3s, color 0.3s;
    }

    .dark-mode {
      --background-light: var(--background-dark);
      --text-dark: var(--text-light);
    }

    .container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      animation: fadeIn 0.5s ease;
    }

    h2 {
      text-align: center;
      color: var(--primary-color);
    }

    button {
      display: block;
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s, transform 0.2s, box-shadow 0.3s;
    }

    button:hover {
      background-color: var(--secondary-color);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    button:active {
      transform: scale(0.95);
    }

    textarea, input {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border-radius: 5px;
      border: 1px solid #ddd;
    }

    .hidden {
      display: none;
    }

    .chat-messages, .video-list, .friend-list, .notification-list {
      margin-top: 20px;
      padding: 10px;
      border-radius: 8px;
      background: #f9f9f9;
      height: 200px;
      overflow-y: auto;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: scale(0.95);
      }
      to {
        opacity: 1;
        transform: scale(1);
      }
    }
  </style>
</head>
<body>
  <!-- Ana Sayfa -->
  <div class="container" id="mainPage">
    <h2>Uygulamamıza Hoş Geldiniz!</h2>
    <button onclick="navigateTo('profilePage')">Profil</button>
    <button onclick="navigateTo('chatPage')">Sohbet</button>
    <button onclick="navigateTo('videoPage')">Videolar</button>
    <button onclick="navigateTo('friendsPage')">Arkadaşlar</button>
    <button onclick="navigateTo('notificationsPage')">Bildirimler</button>
  </div>

  <!-- Profil Sayfası -->
  <div class="container hidden" id="profilePage">
    <h2>Profil</h2>
    <p>Kullanıcı Adı: Kullanıcı</p>
    <input type="password" id="password" placeholder="Yeni Şifre">
    <button id="updatePasswordButton">Şifreyi Güncelle</button>
    <button onclick="navigateTo('mainPage')">Ana Sayfaya Dön</button>
  </div>

  <!-- Sohbet Sayfası -->
  <div class="container hidden" id="chatPage">
    <h2>Sohbet</h2>
    <textarea id="chatInput" placeholder="Mesaj yazın..."></textarea>
    <button id="sendChatButton">Gönder</button>
    <div class="chat-messages" id="chatMessages"></div>
    <button onclick="navigateTo('mainPage')">Ana Sayfaya Dön</button>
  </div>

  <!-- Video Sayfası -->
  <div class="container hidden" id="videoPage">
    <h2>Videolar</h2>
    <input type="file" id="videoFile" accept="video/*">
    <button id="uploadVideoButton">Video Yükle</button>
    <div class="video-list" id="videoList"></div>
    <button onclick="navigateTo('mainPage')">Ana Sayfaya Dön</button>
  </div>

  <!-- Arkadaş Sayfası -->
  <div class="container hidden" id="friendsPage">
    <h2>Arkadaşlar</h2>
    <input type="text" id="friendInput" placeholder="Arkadaş Ekle">
    <button id="addFriendButton">Ekle</button>
    <div class="friend-list" id="friendList"></div>
    <button onclick="navigateTo('mainPage')">Ana Sayfaya Dön</button>
  </div>

  <!-- Bildirimler Sayfası -->
  <div class="container hidden" id="notificationsPage">
    <h2>Bildirimler</h2>
    <div class="notification-list" id="notificationList"></div>
    <button onclick="navigateTo('mainPage')">Ana Sayfaya Dön</button>
  </div>

  <script>
    function navigateTo(pageId) {
      const pages = document.querySelectorAll('.container');
      pages.forEach(page => page.classList.add('hidden'));
      document.getElementById(pageId).classList.remove('hidden');
    }

    // Sohbet Sistemi
    document.getElementById('sendChatButton').addEventListener('click', () => {
      const message = document.getElementById('chatInput').value.trim();
      if (message) {
        const chatMessages = document.getElementById('chatMessages');
        const newMessage = document.createElement('div');
        newMessage.textContent = message;
        chatMessages.appendChild(newMessage);
        document.getElementById('chatInput').value = '';
      }
    });

    // Video Paylaşımı
    document.getElementById('uploadVideoButton').addEventListener('click', () => {
      const fileInput = document.getElementById('videoFile');
      if (fileInput.files.length > 0) {
        const file = fileInput.files[0];
        const videoUrl = URL.createObjectURL(file);

        const videoList = document.getElementById('videoList');
        const videoItem = document.createElement('div');
        const videoPlayer = document.createElement('video');
        videoPlayer.src = videoUrl;
        videoPlayer.controls = true;
        videoPlayer.style.width = '100%';
        videoItem.appendChild(videoPlayer);
        videoList.appendChild(videoItem);
      }
    });

    // Arkadaş Ekleme
    document.getElementById('addFriendButton').addEventListener('click', () => {
      const friendInput = document.getElementById('friendInput');
      const friendName = friendInput.value.trim();
      if (friendName) {
        const friendList = document.getElementById('friendList');
        const friendItem = document.createElement('div');
        friendItem.textContent = friendName;
        friendList.appendChild(friendItem);
        friendInput.value = '';
      }
    });

    // Şifre Güncelleme
    document.getElementById('updatePasswordButton').addEventListener('click', () => {
      const password = document.getElementById('password').value.trim();
      if (password) {
        alert('Şifre başarıyla güncellendi!');
      } else {
        alert('Lütfen geçerli bir şifre girin.');
      }
    });
  </script>
</body>
</html>
