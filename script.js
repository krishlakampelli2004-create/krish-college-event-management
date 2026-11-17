console.log("College Event Management System Loaded!");
console.log("Welcome to our college events platform.");

document.addEventListener("DOMContentLoaded", () => {
    // 1. Registration form submission handler
    const regForm = document.getElementById("registrationForm");
    const confirmBox = document.getElementById("confirmationMessage");

    if (regForm) {
        regForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const fullName = document.getElementById("fullName").value;
            const eventChoice = document.getElementById("eventChoice").value;

            confirmBox.innerText = `🎉 Congratulations ${fullName}! You have successfully registered for ${eventChoice}.`;
            confirmBox.style.display = "block";
            regForm.reset();
        });
    }

    // 2. Gallery card click interactivity
    const galleryCards = document.querySelectorAll(".gallery-card");
    galleryCards.forEach(card => {
        card.addEventListener("click", () => {
            const title = card.querySelector("h3")?.innerText;
            alert(`Viewing album for: ${title}`);
        });
    });
});
