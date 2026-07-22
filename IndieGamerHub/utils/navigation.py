import streamlit as st

def sidebar():
    return st.sidebar.selectbox(
        "Navigation",
        [
            "Home",
            "Login",
            "Signup",
            "Dashboard",
            "Games"
        ]
    )
