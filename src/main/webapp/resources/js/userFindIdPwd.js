document.addEventListener("click", (e) => {
  if (e.target.classList.contains("btn")) {
    console.log(e.target.closest("tr").querySelector("input").value);
  }
});
