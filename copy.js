// Copy buttons: <button class="copy-btn" data-copy="text to copy">Label</button>
document.querySelectorAll(".copy-btn[data-copy]").forEach((button) => {
  const label = button.textContent;
  button.addEventListener("click", async () => {
    try {
      await navigator.clipboard.writeText(button.dataset.copy);
      button.textContent = "Copied";
    } catch {
      button.textContent = "Couldn't copy";
    }
    setTimeout(() => (button.textContent = label), 1800);
  });
});
