import mdb from "mdb-ui-kit"

const mdbInputUpdate = () => {
  document.querySelectorAll('.form-outline').forEach((formOutline) => {
    new mdb.Input(formOutline).init();
  });
}

document.addEventListener('turbo:render', () => {
  mdbInputUpdate();
});