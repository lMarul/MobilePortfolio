import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 💼 EXPERIENCE MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Work experience model:
/// - _id: string
/// - _creationTime: number
/// - title: string
/// - organization: string
/// - type: "employment" | "internship" | "ojt" | "student-org" | "freelance" | "volunteer"
/// - location: string
/// - startDate: string
/// - endDate?: string (null = current position)
/// - isCurrent: boolean
/// - description: string
/// - responsibilities: string[]
/// - achievements: string[]
/// - logo?: string
/// - color?: string
/// - technologies: string[]

@freezed
sealed class Experience with _$Experience {
  const factory Experience({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: '_creationTime') required double creationTime,
    required String title,
    required String organization,
    required String type,
    required String location,
    required String startDate,
    String? endDate,
    @Default(false) bool isCurrent,
    required String description,
    @Default([]) List<String> responsibilities,
    @Default([]) List<String> achievements,
    String? logo,
    String? color,
    @Default([]) List<String> technologies,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  static List<Experience> get fallback => [
        // ═══════════════════════════════════════════════════════════════════════
        // 2025 - PRESENT (CURRENT POSITIONS)
        // ═══════════════════════════════════════════════════════════════════════
        const Experience(
          id: 'exp-1',
          creationTime: 0,
          title: 'Prime Minister',
          organization: 'APC SPEAKS',
          description:
              'The Prime Minister serves as the chief executive and highest-ranking officer of APC–SPEAKS. As the head of the organization, the Prime Minister provides overall leadership, ensures the achievement of the organization\'s mission, and represents APC–SPEAKS within the school community and beyond. This role upholds the values of public speaking, debate, and student leadership while guiding the organization\'s members toward growth and excellence.',
          startDate: '2025',
          endDate: null,
          location: 'Makati City',
          type: 'student-org',
          isCurrent: true,
          technologies: ['Public Speaking', 'Leadership'],
          responsibilities: [
            'Provide overall leadership and strategic direction for APC-SPEAKS',
            'Ensure achievement of organizational mission and objectives',
            'Represent APC-SPEAKS within the school community and beyond',
            'Guide members toward growth and excellence in public speaking',
            'Uphold values of public speaking, debate, and student leadership',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-6',
          creationTime: 0,
          title: 'Vice President Internal',
          organization:
              'Junior Information Systems Security Association - Asia Pacific College',
          description:
              'As the Vice President Internal for the Junior Information Systems Security Association - Asia Pacific College (JISSA-APC), I provide strategic Leadership to oversee the organization\'s internal operations and foster a cohesive community of cybersecurity enthusiasts. My role focuses on comprehensive Event Planning for key initiatives, including General Assemblies, team-building sessions, and skill-development workshops, ensuring alignment with our mission. I also drive effective Event Management by coordinating logistics and streamlining communication across departments, ensuring that all internal activities run seamlessly to maximize member engagement and organizational growth.',
          startDate: '2025',
          endDate: null,
          location: 'Makati City',
          type: 'student-org',
          isCurrent: true,
          technologies: [
            'Leadership',
            'Event Management',
            'Event Planning',
            'Cybersecurity',
          ],
          responsibilities: [
            'Oversee internal operations and organizational leadership',
            'Foster cohesive community of cybersecurity enthusiasts',
            'Plan and coordinate General Assemblies and workshops',
            'Organize team-building sessions and skill-development initiatives',
            'Coordinate logistics across departments',
            'Streamline communication for seamless event execution',
            'Maximize member engagement and organizational growth',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-2',
          creationTime: 0,
          title: 'Executive Logistics Officer',
          organization: 'APC SOAR',
          description:
              'The Executive Logistics Officer ensures the smooth and efficient management of all logistical requirements for SOAR activities, projects, and events. This role is vital in supporting the organization\'s operations by handling resources, venues, materials, and on-ground coordination.',
          startDate: '2025',
          endDate: null,
          location: 'Makati City',
          type: 'student-org',
          isCurrent: true,
          technologies: ['Logistics Management', 'Operations'],
          responsibilities: [
            'Manage all logistical requirements for SOAR activities and events',
            'Handle resource allocation and venue coordination',
            'Oversee materials preparation and distribution',
            'Coordinate on-ground logistics during events',
            'Support organization operations through efficient logistics management',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-3',
          creationTime: 0,
          title: 'Logistics Head',
          organization: 'Microsoft Community - Asia Pacific College',
          description:
              'The Logistics Head ensures the smooth and efficient management of all logistical requirements for APC-MSC activities, projects, and events. This role is vital in supporting the organization\'s operations by handling resources, venues, materials, and on-ground coordination.',
          startDate: '2025',
          endDate: null,
          location: 'Makati City',
          type: 'student-org',
          isCurrent: true,
          technologies: ['Logistics Management', 'Project Coordination'],
          responsibilities: [
            'Lead logistics team in managing APC-MSC events and activities',
            'Coordinate venue bookings and equipment setup',
            'Manage inventory of materials and resources',
            'Oversee on-ground coordination during events',
            'Ensure efficient logistics operations for all organization activities',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-4',
          creationTime: 0,
          title: 'Logistics Officer',
          organization: 'APC Gaming Genesis',
          description:
              'As a Logistics Officer for APC Gaming Genesis, I provide essential logistical support to ensure the seamless execution of gaming tournaments and community events. My responsibilities include coordinating venue setups, managing equipment inventory, and overseeing resource allocation to maintain operational efficiency during high-paced activities.',
          startDate: '2025',
          endDate: null,
          location: 'Makati City',
          type: 'student-org',
          isCurrent: true,
          technologies: ['Logistic Support', 'Event Management'],
          responsibilities: [
            'Coordinate venue setups for gaming tournaments and events',
            'Manage equipment inventory and technical resources',
            'Oversee resource allocation for operational efficiency',
            'Support seamless execution of gaming community events',
            'Maintain operational efficiency during high-paced activities',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-5',
          creationTime: 0,
          title: 'Assistant Developer Lead',
          organization: 'Junior Philippine Computer Society - Asia Pacific College',
          description:
              'As the Assistant Developer Lead for the Junior Philippine Computer Society - Asia Pacific College, I co-manage the technical team\'s operations, ensuring the successful deployment of organization-wide software initiatives. My responsibilities focus on strategic Project Planning to optimize development timelines and resource allocation, alongside rigorous Quality Assurance testing to guarantee system reliability and performance.',
          startDate: '2025',
          endDate: null,
          location: 'Makati City',
          type: 'student-org',
          isCurrent: true,
          technologies: [
            'Quality Assurance',
            'Project Planning',
            'Software Documentation',
            'Flutter',
            'Dart',
          ],
          responsibilities: [
            'Co-manage technical team operations and software initiatives',
            'Conduct strategic project planning for development timelines',
            'Optimize resource allocation for development projects',
            'Perform rigorous quality assurance testing',
            'Ensure system reliability and performance standards',
            'Maintain comprehensive software documentation',
          ],
          achievements: [],
        ),

        // ═══════════════════════════════════════════════════════════════════════
        // 2024 - 2025 (PAST POSITIONS)
        // ═══════════════════════════════════════════════════════════════════════
        const Experience(
          id: 'exp-7',
          creationTime: 0,
          title: 'Logistics Associate',
          organization: 'Microsoft Community - Asia Pacific College',
          description:
              'The Logistics Officer supports the Executive Committee by handling logistical requirements for APC-MSC\'s projects, meetings, and events. The officer ensures that all materials, venues, and resources are prepared and available to guarantee the smooth execution of activities.',
          startDate: '2024',
          endDate: '2025',
          location: 'Makati City',
          type: 'student-org',
          isCurrent: false,
          technologies: ['Logistic Support', 'Logistics Management'],
          responsibilities: [
            'Support Executive Committee with logistical requirements',
            'Handle logistics for projects, meetings, and events',
            'Prepare and manage materials and resources',
            'Coordinate venue arrangements',
            'Ensure smooth execution of all activities',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-8',
          creationTime: 0,
          title: 'Member',
          organization: 'Junior Philippine Computer Society - Asia Pacific College',
          description:
              'As a member of JPCS, I commit to actively participating in the organization\'s activities that promote growth in the field of information technology and computer science. I represent the organization in both internal and external events while developing my skills, knowledge, and network.',
          startDate: '2024',
          endDate: '2025',
          location: 'Makati City',
          type: 'student-org',
          isCurrent: false,
          technologies: ['Team Building', 'Professional Development'],
          responsibilities: [
            'Actively participate in IT and computer science activities',
            'Represent organization in internal and external events',
            'Develop technical skills and knowledge',
            'Build professional network within the IT community',
            'Contribute to organizational growth initiatives',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-9',
          creationTime: 0,
          title: 'Operations Associate',
          organization:
              'Junior Information Systems Security Association - Asia Pacific College',
          description:
              'The Operations Associate ensures the effective coordination of both logistical and event-related tasks for JISSA - APC Chapter\'s activities. Serving as a bridge between the Logistics and Events Committees, this role involves preparing resources, supporting program execution, and ensuring that all operations run smoothly from planning to post-event wrap-up.',
          startDate: '2024',
          endDate: '2025',
          location: 'Makati City',
          type: 'student-org',
          isCurrent: false,
          technologies: [
            'Operations Administration',
            'Event Management',
            'Logistic Support',
            'Logistics Management',
          ],
          responsibilities: [
            'Coordinate logistical and event-related tasks',
            'Bridge communication between Logistics and Events Committees',
            'Prepare resources for JISSA activities',
            'Support program execution from planning to completion',
            'Ensure smooth operations and post-event wrap-up',
          ],
          achievements: [],
        ),
        const Experience(
          id: 'exp-10',
          creationTime: 0,
          title: 'Work Immersion Student',
          organization: 'Taguig City Health Office, Sanitation Office',
          description:
              'Completed work immersion program at the Taguig City Health Office Sanitation Office, gaining hands-on experience in public health administration and database management. Assisted in producing health IDs and certificates while encoding critical information into government databases. This immersion provided valuable exposure to professional workplace culture, enabling direct collaboration with healthcare professionals and government employees to understand real-world administrative operations in public health services.',
          startDate: '2024',
          endDate: '2024',
          location: 'Taguig City, Philippines',
          type: 'ojt',
          isCurrent: false,
          technologies: [
            'Database Management',
            'Document Processing',
            'MS Office',
          ],
          responsibilities: [
            'Produce and process health IDs and certificates',
            'Encode public health information into government databases',
            'Maintain accuracy in data entry and record management',
            'Assist in administrative operations of the Sanitation Office',
            'Collaborate with health professionals and government staff',
          ],
          achievements: [
            'Successfully completed work immersion program',
            'Gained practical experience in public health administration',
            'Developed professional workplace skills and etiquette',
          ],
        ),
      ];
}
