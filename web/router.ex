defmodule Metanoia.Router do
  use Metanoia.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

  end

  scope "/", Metanoia do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Metanoia do
    pipe_through :api
    resources "/mentoring", MentoringController, except: [:new, :edit]

    resources "/addresses", AddressController, except: [:new, :edit]
    resources "/address_types", AddressTypeController, except: [:new, :edit]
    resources "/churches", ChurchController, except: [:new, :edit]
    resources "/clients", ClientController, except: [:new, :edit]
    resources "/client_communications", ClientCommunicationController, except: [:new, :edit]
    resources "/client_commmunication_types", ClientCommunicationTypeController, except: [:new, :edit]
    resources "/client_status", ClientStatusController, except: [:new, :edit]
    resources "/client_volunteer_assignments", ClientVolunteerAssignmentController, except: [:new, :edit]
    resources "/courses", CourseController, except: [:new, :edit]
    resources "/curriculums", CurriculumController, except: [:new, :edit]
    resources "/denominations", DenominationController, except: [:new, :edit]
    resources "/facilities", FacilityController, except: [:new, :edit]
    resources "/genders", GenderController, except: [:new, :edit]
    resources "/jurisdictions", JurisdictionController, except: [:new, :edit]
    resources "/lessons", LessonController, except: [:new, :edit]
    resources "/mentor_groups", MentorGroupController, except: [:new, :edit]
    resources "/mentor_group_assignments", MentorGroupAssignmentController, except: [:new, :edit]
    resources "/parole_status", ParoleStatusController, except: [:new, :edit]
    resources "/pastors", PastorController, except: [:new, :edit]
    resources "/persons", PersonController, except: [:new, :edit]
    resources "/presbyteries", PresbyteryController, except: [:new, :edit]
    resources "/programs", ProgramController, except: [:new, :edit]
    resources "/relationship_preferences", RelationshipPreferenceController, except: [:new, :edit]
    resources "/schedule_entries", ScheduleEntryController, except: [:new, :edit]
    resources "/security_levels", SecurityLevelController, except: [:new, :edit]
    resources "/states", StateController, except: [:new, :edit]
    resources "/student_lessons", StudentLessonController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/volunteers", VolunteerController, except: [:new, :edit]
    resources "/volunteer_credentials", VolunteerCredentialController, except: [:new, :edit]
    resources "/volunteer_program_assignments", VolunteerProgramAssignmentController, except: [:new, :edit]
    resources "/volunteer_status", VolunteerStatusController, except: [:new, :edit]
  end
end
