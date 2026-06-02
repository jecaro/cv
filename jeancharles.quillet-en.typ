#import "@preview/modern-cv:0.10.0": *

#show text: set text(size: 0.95em)

#show: resume.with(
  author: (
    firstname: "Jean-Charles",
    lastname: "Quillet",
    email: "jeancharles.quillet@gmail.com",
    phone: "(+33) 6 65 13 50 75",
    address: "13, rue du clos romain, 35120 Dol-de-Bretagne, FRANCE",
    positions: (
      "Senior Software Engineer",
      "Functional Programming",
    ),
    custom: (
      (
        text: "jeancharles.quillet.org",
        icon: "home",
        link: "https://jeancharles.quillet.org",
      ),
      (
        text: "jecaro",
        icon: "github",
        link: "https://github.com/jecaro",
      ),
      (
        text: "jeancharlesquillet",
        icon: "linkedin",
        link: "https://www.linkedin.com/in/jeancharlesquillet",
      ),
    ),
  ),
  keywords: ("Engineer", "Architect"),
  description: "Jean-Charles Quillet resume",
  profile-picture: none,
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
  show-address-icon: false,
  paper-size: "a4",
  contact-items-separator: h(3pt) + "•" + h(3pt),
)

#include "sections/summary.typ"
#include "sections/skills.typ"
#include "sections/experience.typ"
#include "sections/education.typ"
#include "sections/extracurricular.typ"
