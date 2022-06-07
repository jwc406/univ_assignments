const postList = document.querySelector(".js-postList"),
  postInput = document.querySelector(".js-postForm input"),
  postForm = document.querySelector(".js-postForm");

const POST_LS = "posts";

let posts = [];
let idNumbers = 1;

function deletePost(event) {
  const btn = event.target;
  const li = btn.parentNode;
  postList.removeChild(li);
  const index = parseInt(li.id);
  posts.splice(index, 1);
  savePost();
}

function savePost() {
  localStorage.setItem(POST_LS, JSON.stringify(posts));
}

function paintPost(text) {
  const li = document.createElement("li");
  const span = document.createElement("span");
  const delBtn = document.createElement("button");
  const newId = posts.length;
  delBtn.addEventListener("click", deletePost);
  span.innerText = text;
  delBtn.innerHTML = "X";
  delBtn.style =
    "border: none; background:none; color:#FFB02E; margin-left:20px; font-size:smaller;";
  li.appendChild(span);
  li.appendChild(delBtn);
  postList.appendChild(li);
  const postObj = {
    text: text,
    id: newId,
  };
  posts.push(postObj);
  savePost();
}

function handleSubmit(event) {
  event.preventDefault();
  const currentValue = postInput.value;
  paintPost(currentValue);
  postInput.value = "";
}

function loadPost() {
  const loadedPost = localStorage.getItem(POST_LS);
  if (loadedPost !== null) {
    const parsedPost = JSON.parse(loadedPost);
    parsedPost.forEach(function (post) {
      paintPost(post.text);
    });
  }
}

function init() {
  loadPost();
  postForm.addEventListener("submit", handleSubmit);
}

init();
